#ifdef __APPLE__
#include <Core/Checkup.mqh>
#include <Core/Constants.mqh>
#include <Core/DataTypes.mqh>
#include <Core/Enums.mqh>
#include <Core/Functions.mqh>
#include <Core/Structs.mqh>
#endif

#ifndef __APPLE__
#property copyright "Mark Skelton"
#property link "https://github.com/mskelton/fx-data"
#property version "1.00"
#property description "Downloads OHLC data for the current symbol."
#property strict
#endif

int file_handle;

int OnInit() {
  file_handle = FileOpen(Symbol() + ".csv", FILE_WRITE | FILE_CSV, ',');
  FileWrite(file_handle, "time", "open", "high", "low", "close");

  return INIT_SUCCEEDED;
}

void OnDeinit(const int reason) {
  FileClose(file_handle);
}

void OnTick() {
  string sym = Symbol();
  ENUM_TIMEFRAMES period = PERIOD_CURRENT;

  // Convert the time to an ISO8601 string
  MqlDateTime time_struct;
  TimeToStruct(iTime(sym, period, 0), time_struct);
  string time = StringFormat("%04d-%02d-%02dT%02d:%02d:%02dZ", time_struct.year,
                             time_struct.mon, time_struct.day, time_struct.hour,
                             time_struct.min, time_struct.sec);

  // Get the OHLC values for the current bar
  double open = iOpen(sym, period, 0);
  double high = iHigh(sym, period, 0);
  double low = iLow(sym, period, 0);
  double close = iClose(sym, period, 0);

  // Append the current bar data to the CSV file
  FileWrite(file_handle, time, open, high, low, close);
}
