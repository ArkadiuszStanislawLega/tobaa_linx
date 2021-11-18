part of database;

class DatabaseCompatibilityGroup {
  static final Map<CompatibilityGroupType, CompatibilityGroup> container = {
    CompatibilityGroupType.A: new CompatibilityGroup(
        group: CompatibilityGroupType.A,
        description: "Materiały wybuchowe inicjujące"),
    CompatibilityGroupType.B: new CompatibilityGroup(
        group: CompatibilityGroupType.B,
        description: "Przedmioty zawierające materiał wybuchowy inicjujący i niemające dwóch lub więcej skutecznych urządzeń zabezpieczających (niektóre przedmioty takie jak: zapalniki typu kapsułkowego, zestawy zapalnikowe do prac wybuchowych i spłonki, nawet, jeśli nie zawierają materiałów wybuchowych inicjujących)"),
    CompatibilityGroupType.C: new CompatibilityGroup(
        group: CompatibilityGroupType.C,
        description: "Materiały wybuchowe miotające lub inne deflagrujące materiały wybuchowe (ulegające spalaniu, które przechodzi w eksplozję lub detonację) lub przedmioty zawierające takie materiały"),
    CompatibilityGroupType.D: new CompatibilityGroup(
        group: CompatibilityGroupType.D,
        description: "Wtórnie detonujące materiał wybuchowy, proch czarny lub przedmioty zawierające wtórnie detonujący materiały wybuchowy, bez środków inicjujących i bez ładunku miotającego, lub przedmioty zawierającemateriał wybuchowy inicjujący i mające dwa lub więcej skuteczne urządzenia zabezpieczające"),
    CompatibilityGroupType.E: new CompatibilityGroup(
        group: CompatibilityGroupType.E,
        description: "Przedmioty zawierające wtórnie detonujący materiał wybuchowy, bez środka inicjującego, z ładunkiem miotającym (z wykluczeniem ładunku zawierającego materiał ciekły łatwo zapalny, żel lub ciecze samozapalne)"),
    CompatibilityGroupType.F: new CompatibilityGroup(
        group: CompatibilityGroupType.F,
        description: "Przedmioty zawierające wtórnie detonujący materiał wybuchowy z własnym środkiem inicjującym, z ładunkiem miotającym (z wykluczeniem ładunku zawierającego materiał ciekły łatwo zapalny, żellub ciecze samozapalne) lub bez ładunku miotającego"),
    CompatibilityGroupType.G: new CompatibilityGroup(
        group: CompatibilityGroupType.G,
        description: "Materiały pirotechniczne lub przedmioty zawierające materiał pirotechniczny, przedmioty zawierające materiał wybuchowy i materiał oświetlający, zapalający, łzawiący lub dymotwórczy (z wykluczeniem przedmiotów aktywowanych, woda lub przedmiotów zawierających biały fosfor, fosforki, materiał pirotechniczny, materiał ciekły łatwo zapalny, żel lub ciecze samozapalne)"),
    CompatibilityGroupType.H: new CompatibilityGroup(
        group: CompatibilityGroupType.H,
        description: "Przedmioty zawierające materiał wybuchowy i biały fosfor"),
    CompatibilityGroupType.J: new CompatibilityGroup(
        group: CompatibilityGroupType.J,
        description: "Przedmioty zawierające materiał wybuchowy i materiał łatwo zapalny lub żel"),
    CompatibilityGroupType.K: new CompatibilityGroup(
        group: CompatibilityGroupType.K,
        description: "Przedmioty zawierające materiał wybuchowy oraz środki chemiczne"),
    CompatibilityGroupType.L: new CompatibilityGroup(
        group: CompatibilityGroupType.L,
        description: "Materiały wybuchowe lub przedmioty zawierające materiał wybuchowy, przedstawiający szczególne zagrożenie (itp. z powodu swojej podatności na aktywację wodą lub obecności cieczy samozapalnych, fosforków lub materiałów pirotechnicznych), wymagające oddzielenia każdego rodzaju wyrobów"),
    CompatibilityGroupType.N: new CompatibilityGroup(
        group: CompatibilityGroupType.N,
        description: "Przedmioty zawierające jedynie materiał wybuchowy skrajnie niewrażliwy"),
    CompatibilityGroupType.S: new CompatibilityGroup(
        group: CompatibilityGroupType.S,
        description: "Materiały lub przedmioty tak zapakowane lub zbudowane, aby jakiekolwiek niebezpieczne następstwa przypadkowego zadziałania ograniczały się do przestrzeni wewnętrznej opakowania, pod warunkiem, że ogień nie zniszczy opakowania i w związku z tym następstwa wybuchu lub rozrzutu będą ograniczone do takiego stopnia, że nie będą w istotny sposób utrudniać lub ograniczać gaszenia ognia lub stosowania innych działań ratunkowych w najbliższym sąsiedztwie opakowania"),
  };
}