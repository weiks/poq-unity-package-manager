  @implementation SafariViewController
  - (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    NSLog(@"safariViewControllerDidFinish");
    UnitySendMessage("Quarters SDK", "OnAuthCompleted", "");
  }

  - (void)safariViewController:(SFSafariViewController *)controller initialLoadDidRedirectToURL:(NSURL *)URL {
    NSLog(@"safariViewController:initialLoadDidRedirectToURL: %@", URL.absoluteString);
    // Close the webview when the URL changes
    [controller dismissViewControllerAnimated:YES completion:nil];
  }
  @end

Expand All
	@@ -35,7 +41,7 @@ void launchUrl(const char * url)
    // Assign a delegate to handle when the user presses the 'Done' button
    svc = [[SafariViewController alloc] init];
    sfvc.delegate = svc;

    // Start the generated SFSafariViewController object
    [uvc presentViewController:sfvc animated:YES completion:nil];

    NSLog(@"Presented SFSafariViewController");
  }
 
  void dismiss()
  {
    UIViewController * uvc = UnityGetGLViewController();
    [uvc dismissViewControllerAnimated:YES completion:nil];
  }
}