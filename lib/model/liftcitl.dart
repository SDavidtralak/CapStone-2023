// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_declarations

class Exercise {
  int Exercise_id;
  String? Exercise_name;
  String? Exercise_Reps;
  String? Exercise_desc;
  String? Exercise_muscle_group;

  Exercise(this.Exercise_id, this.Exercise_name, this.Exercise_Reps,
      this.Exercise_desc, this.Exercise_muscle_group);
}

class Workouts {
  int Workout_id;
  String? Workout_name;
  String? Workout_image;

  Workouts(this.Workout_id, this.Workout_name, this.Workout_image);
}
