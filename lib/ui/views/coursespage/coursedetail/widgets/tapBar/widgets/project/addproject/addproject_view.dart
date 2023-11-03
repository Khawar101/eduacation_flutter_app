import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'addproject_viewmodel.dart';

class AddprojectView extends StackedView<AddprojectViewModel> {
  final CoursesModel courseData;
  const AddprojectView(this.courseData, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddprojectViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add your project",
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              TextFormField(
                // minLines: 6,
                // maxLines: null,
                controller: viewModel.projectName,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(),
                  hintText: 'Project name',
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                minLines: 6,
                maxLines: null,
                controller: viewModel.projectDescription,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: courseData.projects?.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: () {
                                      viewModel.sendImage(
                                          ImageSource.gallery,
                                          courseData.uID,
                                          courseData.publishDate);
                                    },
                                    child: Center(
                                      child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff4873a6)
                                                  .withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Center(
                                              child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ))),
                                    ),
                                  ))); // Placeholder for the first index
                        } else {
                          return Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/Paul-Wilson.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ));
                        }
                      }),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF4873A6).withOpacity(0.7),
                ),
                child: const Center(
                    child: ButtonText(text: 'Save', color: Colors.white)),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AddprojectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddprojectViewModel();
}
