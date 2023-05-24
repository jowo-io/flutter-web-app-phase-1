<!DOCTYPE html>
<html>
<head>
  <!--
    If you are serving your web app in a path other than the root, change the
    href value below to reflect the base path you are serving from.

    The path provided below has to start and end with a slash "/" in order for
    it to work correctly.

    For more details:
    * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base

    This is a placeholder for base href that will be replaced by the value of
    the `--base-href` argument provided to `flutter build`.
  -->
  <base href="/">

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="A new Flutter project.">

  <!-- iOS meta tags & icons -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="flutter_application_1">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="favicon.png"/>

  <title>flutter_application_1</title>

  <link rel="manifest" href="manifest.json">

  <?php
    $url = "https://$_SERVER[HTTP_HOST]";
    $image = "$url/meta/default.png";
    $title = "JoWo Site";
    $description = "The site of JoWo";

    switch($_SERVER[REQUEST_URI]){
      case "/search":
        $title = "Search";
        $description = "Search for things";
      break;
      case "/podcasts":
        $title = "Podcasts";
        $description = "See all the Podcasts";
      break;
      case "/wallet":
        $title = "wallet";
        $description = "Your wallet";
      break;
      case "/profile":
        $title = "Profile";
        $description = "Your profile";
      break;
      case "/podcasts/foo":
        $image = "$url/meta/foo.png";
        $title = "Foo";
        $description = "Foo Bar";
      break;
      case "/podcasts/hello":
        $image = "$url/meta/hello.png";
        $title = "Hello";
        $description = "Hello world";
      break;
      case "/podcasts/lorem":
        $image = "$url/meta/lorem.png";
        $title = "Lorem";
        $description = "Lorem Ipsum";
      break;
    }
  ?>

  <!-- {/* basic */} -->
  <title><? echo $title ?></title>
  <meta content="<? echo $description ?>" name="description"></meta>

  <!-- {/* open graph */} -->
  <meta content="website" property="og:type"></meta>
  <meta content="jowo.site" property="og:site_name"></meta>
  <meta content="<? echo $description ?>" property="og:title"></meta>
  <meta content="<? echo $description ?>" property="og:description"></meta>
  <meta content="<? echo $image ?>" property="og:image"></meta>
  <meta content="<? echo $url ?>" property="og:url"></meta>

  <!-- {/* twitter */} -->
  <meta content="summary" name="twitter:card"></meta>
  <meta content="<? echo $title ?>" name="twitter:title"></meta>
  <meta content="<? echo $title ?>" name="twitter:text:title"></meta>
  <meta content="<? echo $description ?>" name="twitter:description"></meta>
  <meta content="<? echo $image ?>" name="twitter:image"></meta>

  <script>
    // The value below is injected by flutter build, do not touch.
    var serviceWorkerVersion = "1004238824";
  </script>
  <!-- This script adds the flutter initialization JS code -->
  <script src="flutter.js" defer></script>
</head>
<body>
  <script>
    window.addEventListener('load', function(ev) {
      // Download main.dart.js
      _flutter.loader.loadEntrypoint({
        serviceWorker: {
          serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: function(engineInitializer) {
          engineInitializer.initializeEngine().then(function(appRunner) {
            appRunner.runApp();
          });
        }
      });
    });
  </script>
</body>
</html>
