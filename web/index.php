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


<?php
  $tags = "";

  // <!-- {/* basic */} -->
  $tags .= '<title>'.$title.'</title>';
  $tags .= '<meta content="'.$description.'" name="description"></meta>';

  // <!-- {/* open graph */} -->
  $tags .= '<meta content="website" property="og:type"></meta>';
  $tags .= '<meta content="jowo.site" property="og:site_name"></meta>';
  $tags .= '<meta content="'.$description.'" property="og:title"></meta>';
  $tags .= '<meta content="'.$description.'" property="og:description"></meta>';
  $tags .= '<meta content="'.$image.'" property="og:image"></meta>';
  $tags .= '<meta content="'.$url.'" property="og:url"></meta>';

  // <!-- {/* twitter */} -->
  $tags .= '<meta content="summary" name="twitter:card"></meta>';
  $tags .= '<meta content="'.$title.'" name="twitter:title"></meta>';
  $tags .= '<meta content="'.$title.'" name="twitter:text:title"></meta>';
  $tags .= '<meta content="'.$description.'" name="twitter:description"></meta>';
  $tags .= '<meta content="'.$image.'" name="twitter:image"></meta>';
?>


<?php
  $html=file_get_contents("./index.html");
  $replace_block = '<!-- ssr_tags_injected_here -->';
  $html=str_replace($replace_block,$tags,$html);
  echo $html
?>