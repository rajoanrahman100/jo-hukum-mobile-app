class KeywordClass {
  int count;
  int pageSize;
  int current;
  List<Results> results;

  KeywordClass({this.count, this.pageSize, this.current, this.results});

  KeywordClass.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pageSize = json['page_size'];
    current = json['current'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['page_size'] = this.pageSize;
    data['current'] = this.current;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String displayName;
  int order;
  bool showAsSlider;
  String sId;
  String name;
  String slug;
  String icon;
  String banner;
  String parent;
  int childrenCount;

  Results(
      {this.displayName,
        this.order,
        this.showAsSlider,
        this.sId,
        this.name,
        this.slug,
        this.icon,
        this.banner,
        this.parent,
        this.childrenCount});

  Results.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    order = json['order'];
    showAsSlider = json['show_as_slider'];
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    banner = json['banner'];
    parent = json['parent'];
    childrenCount = json['children_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['order'] = this.order;
    data['show_as_slider'] = this.showAsSlider;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['banner'] = this.banner;
    data['parent'] = this.parent;
    data['children_count'] = this.childrenCount;
    return data;
  }
}