class ProductDataModel {
  int? id;
  String? imageURL;
  String? name;
  String? characterClass;
  int? level;
  String? background;
  String? playerName;
  String? race;
  String? alignment;
  String? exp;
  int? ac;
  int? initiative;
  int? speed;
  int? hpMax;
  int? currentHP;
  int? temporaryHP;
  int? hitDice;
  String? inventory;
  String? personalityTraits;
  String? ideals;
  String? bonds;
  String? flaws;
  int? strength;
  int? dexterity;
  int? constitution;
  int? intelligence;
  int? wisdom;
  int? charisma;
  int? stStrength;
  int? stDexterity;
  int? stConstitution;
  int? stIntelligence;
  int? stWisdom;
  int? stCharisma;
  int? acrobatics;
  int? animalHand;
  int? arcana;
  int? athletics;
  int? deception;
  int? history;
  int? insight;
  int? intimidation;
  int? investigation;
  int? medicine;
  int? nature;
  int? perception;
  int? performance;
  int? persuasion;
  int? religion;
  int? sleightHand;
  int? stealth;
  int? survival;
  String? characterAppearance;
  String? alliesAndOrg;
  String? backstory;
  String? featuresOrTraits;
  String? treasure;
  String? spells;

  ProductDataModel({
    this.id,
    this.imageURL,
    this.name,
    this.characterClass,
    this.level,
    this.background,
    this.playerName,
    this.race,
    this.alignment,
    this.exp,
    this.ac,
    this.initiative,
    this.speed,
    this.hpMax,
    this.currentHP,
    this.temporaryHP,
    this.hitDice,
    this.inventory,
    this.personalityTraits,
    this.ideals,
    this.bonds,
    this.flaws,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.stStrength,
    this.stDexterity,
    this.stConstitution,
    this.stIntelligence,
    this.stWisdom,
    this.stCharisma,
    this.acrobatics,
    this.animalHand,
    this.arcana,
    this.athletics,
    this.deception,
    this.history,
    this.insight,
    this.intimidation,
    this.investigation,
    this.medicine,
    this.nature,
    this.perception,
    this.performance,
    this.persuasion,
    this.religion,
    this.sleightHand,
    this.stealth,
    this.survival,
    this.characterAppearance,
    this.alliesAndOrg,
    this.backstory,
    this.featuresOrTraits,
    this.treasure,
    this.spells,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageURL,
      'name': name,
      'Class': characterClass,
      'Level': level,
      'Background': background,
      'PlayerName': playerName,
      'Race': race,
      'Alignment': alignment,
      'Exp': exp,
      'AC': ac,
      'Initiative': initiative,
      'Speed': speed,
      'HPMax': hpMax,
      'CurrentHP': currentHP,
      'temporaryHP': temporaryHP,
      'HitDice': hitDice,
      'Inventory': inventory,
      'PersonalityTraits': personalityTraits,
      'Ideals': ideals,
      'Bonds': bonds,
      'Flaws': flaws,
      'Strength': strength,
      'Dexterity': dexterity,
      'Constitution': constitution,
      'Intelligence': intelligence,
      'Wisdom': wisdom,
      'Charisma': charisma,
      'STStrength': stStrength,
      'STDexterity': stDexterity,
      'STConstitution': stConstitution,
      'STIntelligence': stIntelligence,
      'STWisdom': stWisdom,
      'STCharisma': stCharisma,
      'Acrobatics': acrobatics,
      'AnimalHand': animalHand,
      'Arcana': arcana,
      'Athlethics': athletics,
      'Deception': deception,
      'History': history,
      'Insight': insight,
      'Intimidation': intimidation,
      'Investigation': investigation,
      'Medicine': medicine,
      'Nature': nature,
      'Perception': perception,
      'Performance': performance,
      'Persuasion': persuasion,
      'Religion': religion,
      'SleightHand': sleightHand,
      'Stealth': stealth,
      'Survival': survival,
      'CharacterAppearance': characterAppearance,
      'AlliesandOrg': alliesAndOrg,
      'Backstory': backstory,
      'FeaturesorTraits': featuresOrTraits,
      'Treasure': treasure,
      'Spells': spells,
    };
  }
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      imageURL: json['imageUrl'],
      name: json['name'],
      characterClass: json['Class'],
      level: json['Level'],
      background: json['Background'],
      playerName: json['PlayerName'],
      race: json['Race'],
      alignment: json['Alignment'],
      exp: json['Exp'],
      ac: json['AC'],
      initiative: json['Initiative'],
      speed: json['Speed'],
      hpMax: json['HPMax'],
      currentHP: json['CurrentHP'],
      temporaryHP: json['temporaryHP'],
      hitDice: json['HitDice'],
      inventory: json['Inventory'],
      personalityTraits: json['PersonalityTraits'],
      ideals: json['Ideals'],
      bonds: json['Bonds'],
      flaws: json['Flaws'],
      strength: json['Strength'],
      dexterity: json['Dexterity'],
      constitution: json['Constitution'],
      intelligence: json['Intelligence'],
      wisdom: json['Wisdom'],
      charisma: json['Charisma'],
      stStrength: json['STStrength'],
      stDexterity: json['STDexterity'],
      stConstitution: json['STConstitution'],
      stIntelligence: json['STIntelligence'],
      stWisdom: json['STWisdom'],
      stCharisma: json['STCharisma'],
      acrobatics: json['Acrobatics'],
      animalHand: json['AnimalHand'],
      arcana: json['Arcana'],
      athletics: json['Athlethics'],
      deception: json['Deception'],
      history: json['History'],
      insight: json['Insight'],
      intimidation: json['Intimidation'],
      investigation: json['Investigation'],
      medicine: json['Medicine'],
      nature: json['Nature'],
      perception: json['Perception'],
      performance: json['Performance'],
      persuasion: json['Persuasion'],
      religion: json['Religion'],
      sleightHand: json['SleightHand'],
      stealth: json['Stealth'],
      survival: json['Survival'],
      characterAppearance: json['CharacterAppearance'],
      alliesAndOrg: json['AlliesandOrg'],
      backstory: json['Backstory'],
      featuresOrTraits: json['FeaturesorTraits'],
      treasure: json['Treasure'],
      spells: json['Spells'],
    );
  }
}
