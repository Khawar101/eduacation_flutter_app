import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProjectTab extends ViewModelWidget<StudentInformationViewModel> {
  const ProjectTab({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StudentInformationViewModel viewModel,
  ) {
    //  return StreamBuilder<List<CoursesModel>>(
    //     stream: viewModel.coursesService.coursesStream(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
    //       if (snapshot.hasError) {
    //         return Text(snapshot.error.toString());
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Loading(100);
    //       }
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: viewModel.coursesService.projectData.length,
          // 15,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02, top: 12),
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        //  Image.network(
                        //     viewModel.coursesService.projectData[0].url.toString())
                        Image.asset(
                      'assets/images/Paul-Wilson.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          }),
    );
  }
}
