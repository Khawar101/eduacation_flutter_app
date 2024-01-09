import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:education/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProjectTab extends ViewModelWidget<StudentInformationViewModel> {
  const ProjectTab({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StudentInformationViewModel viewModel,
  ) {
    return StreamBuilder<List<StudentProjects>>(
        stream: viewModel.coursesService.studentProjectStream(),
        builder: (BuildContext context,
            AsyncSnapshot<List<StudentProjects>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading(100);
          }
          List<StudentProjects>? data = snapshot.data;
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data!.length,
                //  viewModel.coursesService.projectData.length,
                // 15,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.02,
                        top: 12),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                // viewModel.projects.first.url![0].isNotEmpty
                                //     ? Image.network(
                                //         viewModel.projects.first.url![0],
                                //         fit: BoxFit.cover,
                                //       )
                                //     : Container(),
                                Image.network(
                              data.first.url!.first.toString(),
                              fit: BoxFit.cover,
                            )
                            // data[0].url.toString())
                            // Image.asset(
                            //   'assets/images/Paul-Wilson.jpg',
                            //   fit: BoxFit.cover,
                            // ),
                            )),
                  );
                }),
          );
        });
  }
}
