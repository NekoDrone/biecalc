function bisectionSearch(
  f: Function,
  a0: number,
  b0: number,
  tolerance: number,
  maxIterations: number
): number {
  let n = 0;
  let a = a0;
  let b = b0;
  while (n < maxIterations) {
    let c = (a + b) / 2;
    if (f(c) == 0 || (b - a) / 2 < tolerance) {
      return c;
    } else {
      n++;
      if (f(c) < 0 == f(a) < 0) {
        a = c;
      } else {
        b = c;
      }
    }
  }
  throw new Error("Max iteations reached.");
}

function testFunction(x: number): number {
  return x * x - 4 * x - 12;
}

const result = bisectionSearch(testFunction, -100, 100, 0.001, 1000000);
console.log(result);
