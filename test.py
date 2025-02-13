from rush import build_blocking_provider

client = build_blocking_provider(
    access_token="a22973f8-8a51-44b0-ab72-ec2eeca02352"
)

benchmark = client.benchmark(name="OpenFF Protein-Ligand Binding Benchmark")

rex_file = open("test.rex").read()

submission = client.run_benchmark(
    benchmark.id,
    rex_file,
    "simple submission",
    sample=0.05
)

# client.eval_rex("1 + 2 + 6 / 2 * 3", wait_for_result = True)
