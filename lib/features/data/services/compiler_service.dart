import 'package:dio/dio.dart';

class CompilerService {
  final Dio _dio;

  CompilerService({required Dio dio}) : _dio = dio;

  /// Compile and run Java code
  Future<CompileResult> compileAndRun(String javaCode) async {
    try {
      // For now, we'll simulate compilation
      // In a real implementation, you would:
      // 1. Send code to a Java compilation service
      // 2. Or use a local Java compiler if available
      // 3. Or use an online Java execution service

      await Future.delayed(
          const Duration(seconds: 2)); // Simulate compilation time

      // Simulate successful compilation
      return CompileResult(
        success: true,
        output: 'Hello World!\nProgram executed successfully.',
        error: null,
        executionTime: 150,
      );
    } catch (e) {
      return CompileResult(
        success: false,
        output: null,
        error: e.toString(),
        executionTime: 0,
      );
    }
  }

  /// Format Java code
  Future<String?> formatCode(String javaCode) async {
    try {
      // For now, return the original code
      // In a real implementation, you would use a Java formatter
      await Future.delayed(const Duration(milliseconds: 500));
      return javaCode;
    } catch (e) {
      return null;
    }
  }

  /// Validate Java syntax
  Future<ValidationResult> validateSyntax(String javaCode) async {
    try {
      // Basic syntax validation
      bool hasMainMethod = javaCode.contains('public static void main');
      bool hasClass = javaCode.contains('class ');
      bool hasBrackets = _countBrackets(javaCode);

      List<String> errors = [];
      if (!hasClass) errors.add('Missing class declaration');
      if (!hasMainMethod) errors.add('Missing main method');
      if (!hasBrackets) errors.add('Unmatched brackets');

      return ValidationResult(
        isValid: errors.isEmpty,
        errors: errors,
      );
    } catch (e) {
      return ValidationResult(
        isValid: false,
        errors: [e.toString()],
      );
    }
  }

  bool _countBrackets(String code) {
    int openBrackets = 0;
    for (int i = 0; i < code.length; i++) {
      if (code[i] == '{') openBrackets++;
      if (code[i] == '}') openBrackets--;
      if (openBrackets < 0) return false;
    }
    return openBrackets == 0;
  }
}

class CompileResult {
  final bool success;
  final String? output;
  final String? error;
  final int executionTime; // in milliseconds

  CompileResult({
    required this.success,
    this.output,
    this.error,
    required this.executionTime,
  });
}

class ValidationResult {
  final bool isValid;
  final List<String> errors;

  ValidationResult({
    required this.isValid,
    required this.errors,
  });
}
