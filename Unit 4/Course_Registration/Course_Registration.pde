void setup() {
	Student s1 = new Student("Name");
	Teacher t1 = new Teacher("Name");

	Course c1 = new Course("Yoga and meditation", "YAM", 4, "UI");

	Section section = c1.createSection(t1);
	section.add(s1);
}