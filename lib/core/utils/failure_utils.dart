import '../errors/failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String mapFailureToMessage(context, Failure failure) {
  if (failure is NetworkFailure) {
    return AppLocalizations.of(context)!.networkError;
  }

  if (failure is CacheGetFailure) {
    return AppLocalizations.of(context)!.cacheGetError;
  }

  if (failure is CachePutFailure) {
    return AppLocalizations.of(context)!.cachePutError;
  }

  if (failure is CacheDeleteFailure) {
    return AppLocalizations.of(context)!.cacheDeleteError;
  }

  return AppLocalizations.of(context)!.somethingWentWrong;
}
