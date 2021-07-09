import 'package:get/get.dart';
import 'package:radiosaphir/providers/article_provider.dart';
import 'package:radiosaphir/providers/emission_provider.dart';

class HomeController extends GetxController {
  var articles = <dynamic>[1, 2, 3, 4, 5, 6].obs;
  var emissionList = <dynamic>[].obs;
  var isArticleLoading = true.obs;
  var isEmissionLoading = true.obs;

  @override
  void onInit() {
    loadArticles();
    loadEmissions();
    super.onInit();
  }

  void loadArticles() async {
    isArticleLoading(true);
    try {
      List values = await ArticleProvider().getAll();
      if (values != null) {
        articles.value = values;
      }
    } finally {
      isArticleLoading(false);
    }
  }

  void loadEmissions() async {
    isEmissionLoading(true);
    try {
      var emissions = await EmissionProvider().getAll();
      if (emissions != null) {
        emissionList.value = emissions;
      }
    } finally {
      isEmissionLoading(false);
    }
  }

  getEmissions() {
    return EmissionProvider().getAll();
  }
}
