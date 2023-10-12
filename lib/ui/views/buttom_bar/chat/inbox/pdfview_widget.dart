import 'dart:developer';
import 'package:education/ui/views/buttom_bar/chat/inbox/inbox_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:stacked/stacked.dart';


class PdfViewShow extends StackedView<InboxViewModel> {
  final String sampleUrl;

  const PdfViewShow({Key? key, required this.sampleUrl}) : super(key: key);



  @override
  Widget builder(
    BuildContext context,
    InboxViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text("Load pdf"),
              onPressed: () {
                viewModel.loadPdf(sampleUrl);
              },
            ),
            if (viewModel.pdfFlePath != null)
              Expanded(
                child: Container(
                  child: PdfView(path: viewModel.pdfFlePath!),
                ),
              )
            else
              const Text("Pdf is not Loaded"),
          ],
        ),
      ),
    );
  }

  @override
  InboxViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InboxViewModel();
}
