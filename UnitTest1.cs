using System;
using Npgsql;
using Postgres2Go;
using Xunit;

namespace sandbox
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            using (var runner = PostgresRunner.Start(options: new PostgresRunnerOptions()
            {
            }))
            using (var conn = new NpgsqlConnection(runner.GetConnectionString()))
            using (var cmd = new NpgsqlCommand("select version()", conn))
            {
                conn.Open();
                var version = cmd.ExecuteScalar() as string;

                Console.WriteLine($"PostgreSQL version: {version}");
            }
        }
    }
}
