function newtonRaphson(
  f: Function,
  x0: number,
  tolerance: number,
  maxIterations: number
) {
  let xprev = x0;
  let x = 0;
  let n = 0;
  while (n < maxIterations) {
    x = xprev - f(xprev) / derivative(f)(xprev);
    xprev = x;
    n++;
  }
  return x;
}

function derivative(f: Function): Function {
  const h = 0.0000001;
  return (x) => {
    return (f(x + h) - f(x)) / h;
  };
}

function testFunction(x: number): number {
  return x * x - 4 * x - 12;
}

const root = newtonRaphson(testFunction, -50, 0.1, 500);
console.log(root);
