{
  pkgs,
  ...
}:
{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        url = "https://www.wheresyoured.at/rss/";
      }
      {
        url = "https://www.netcup.com/special-offers.xml?locale=de";
      }
      {
        url = "https://blog.fyralabs.com/feed/";
      }
      {
        url = "https://thelibre.news/rss/";
      }
      {
        url = "https://techhut.tv/index.xml";
      }
      {
        url = "https://nickdiego.dev/index.xml";
      }
    ];
  };
}
