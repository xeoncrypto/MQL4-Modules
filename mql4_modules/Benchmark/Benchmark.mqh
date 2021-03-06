//+------------------------------------------------------------------+
//|                                                    Benchmark.mqh |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property strict


#ifndef _LOAD_MODULE_BENCHMARK
#define _LOAD_MODULE_BENCHMARK


/**
 * Macro for easy execution of benchmark class.
 *
 * @param function_name  Name of function to repeat.
 * @param roop  Number of loops.
 */
#define BenchmarkRun(function_name, roop) \
   if(roop > 0) { \
      Benchmark::roop_count = roop; \
   } \
   Benchmark::Start(); \
   for(int benchmark_roop = 0; benchmark_roop < Benchmark::roop_count; benchmark_roop++) { \
       function_name ; \
   } \
   Benchmark::End();


/** Class dealing with benchmark. */
class Benchmark
{
   private:
      static string benchmark_name;
      static uint  time;

   public:
      static int   roop_count;
      
      static void Start(const string name = "");
      static void End(void);
};


/** @var string benckmark_name  Name of benchmark. */
static string Benchmark::benchmark_name = "";


/** @var uint time  Start time. */
static uint Benchmark::time = 0;


/** @var int roop_count  Number of loops. */
static int Benchmark::roop_count = 10000;


/** Start measurement. */
static void Benchmark::Start(const string name = "")
{
   Benchmark::benchmark_name = name;
   Print("*------------------ Benchmark Start ------------------*");
   Benchmark::time = GetTickCount();
}


/** 
 * End measurement.
 * Output elapsed time.
 */
static void Benchmark::End(void)
{
   Print("Benchmark ", Benchmark::benchmark_name, " : ",
         (double)(GetTickCount() - Benchmark::time) / 1000, 
         "[sec]");
   Print("*------------------- Benchmark End -------------------*");
}


#endif 
