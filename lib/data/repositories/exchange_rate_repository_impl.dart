import 'package:amd_rub_converter/domain/entities/failure.dart';
import 'package:amd_rub_converter/domain/entities/organization_entity.dart';
import 'package:amd_rub_converter/domain/entities/exchange_rate_entity.dart';
import 'package:amd_rub_converter/domain/repositories/exchange_rate_repository.dart';
import 'package:amd_rub_converter/data/data_sources/exchange_rate_local_data_source.dart';
import 'package:amd_rub_converter/data/repositories/repository_impl.dart';
import 'package:amd_rub_converter/data/models/exchange_rate_model.dart';
import 'package:amd_rub_converter/data/models/organization_model.dart';

import 'package:dartz/dartz.dart';

class ExchangeRateRepositoryImpl extends RepositoryImpl
    implements ExchangeRateRepository {
  final ExchangeRateLocalDataSource _dataSource;

  const ExchangeRateRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, double>> convertCurrency(
    double amount,
    ExchangeRateEntity exchangeRate,
  ) =>
      handleDataSourceRequest(
        () => _dataSource.convertCurrency(
          amount,
          ExchangeRateModel.fromEntity(exchangeRate),
        ),
      );

  @override
  Future<Either<Failure, bool>> isExchangeRateValid(int timestamp) =>
      handleDataSourceRequest(() => _dataSource.isExchangeRateValid(timestamp));

  @override
  Future<Either<Failure, ExchangeRateEntity>> readExchangeRateAMDRUB(
    bool cashless,
  ) =>
      handleDataSourceRequest(() async =>
          (await _dataSource.readExchangeRateAMDRUB(cashless)).fromModel());

  @override
  Future<Either<Failure, void>> updateExchangeRateAMDRUB({
    required bool cashless,
    required double rate,
    required int timestamp,
    required List<OrganizationEntity> organizations,
  }) =>
      handleDataSourceRequest(
        () => _dataSource.updateExchangeRateAMDRUB(
          cashless: cashless,
          rate: rate,
          timestamp: timestamp,
          organizations: organizations
              .map((e) => OrganizationModel.fromEntity(e))
              .toList(),
        ),
      );
}
