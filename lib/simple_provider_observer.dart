import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleProviderObserver extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    log('onCreate -- provider: ${provider.runtimeType}');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    log('onChange -- provider: ${provider.runtimeType}, previousValue: $previousValue, newValue: $newValue');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    log('onClose -- provider: ${provider.runtimeType}');
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    log('onError -- provider: ${provider.runtimeType}, error: $error');
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
