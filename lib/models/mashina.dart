class Mashina{
  String? _mashinaNomi;
  String? _mashinaYili;
  String? _mashinaMalumot;
  String? _mashinaNarxi;
  String? _mashinaKichikRasm;
  String? _mashinaKattaRasm;

  Mashina(this._mashinaNomi, this._mashinaYili, this._mashinaMalumot,this._mashinaNarxi, this._mashinaKichikRasm, this._mashinaKattaRasm);

  String? get mashinaKattaRasm => _mashinaKattaRasm;

  set kattaRasm(String value){
    _mashinaKattaRasm = value;
  }

  String? get mashinaKichikRasm => _mashinaKichikRasm;

  set kichikRasm(String value){
    _mashinaKichikRasm = value;
  }

  String? get mashinaMalumot => _mashinaMalumot;
  String? get mashinaNarxi => _mashinaNarxi;
  String? get mashinaNomi => _mashinaNomi;
}