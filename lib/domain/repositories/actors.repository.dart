import 'package:flutter_peli_apps/domain/entities/actor.entity.dart';

abstract class ActorsRepository {
  
  Future< List< Actor >> getActorsByMovie( String movieId );
  
}