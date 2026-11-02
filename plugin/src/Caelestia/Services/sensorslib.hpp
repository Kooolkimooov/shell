#pragma once

#include <qlist.h>

#include <optional>

namespace caelestia::shell::services::sensorslib {

void ensureInit();

[[nodiscard]] std::optional<double> cpuPackageTemp();
[[nodiscard]] std::optional<double> gpuPciAverageTemp();

[[nodiscard]] std::optional<double> cpuPackagePower();
[[nodiscard]] QList<double> cpuFanRpms();
[[nodiscard]] std::optional<double> gpuPciPower();
[[nodiscard]] QList<double> gpuPciFanRpms();

} // namespace caelestia::shell::services::sensorslib
