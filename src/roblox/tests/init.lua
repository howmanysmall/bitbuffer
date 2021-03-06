local try = require(script.try)

local specs = {
    "bitbuffer",
    "bit",
    "byte",
    "unsigned",
    "signed",
    "float",
    "string",
    "terminatedstring",
    "setlengthstring",
    "field",

    "uint8",
    "uint16",
    "uint32",

    "int8",
    "int16",
    "int32",

    "float16",
    "float32",
    "float64",

    "brickcolor",
    "color3",
    "cframe",
    "vector3",
    "vector2",
    "udim2",
    "udim",
    "ray",
    "rect",
    "region3",
    "enum",
    "numberrange",
    "numbersequence",
    "colorsequence",
}

-- local trySpec = require(script.spec.try)
-- if not trySpec(try.new) then
--     print("trySpec failed")
--     return
-- end

for _, v in ipairs(specs) do
    local test = require(script.spec:FindFirstChild(v))
    test(try.new)
end

local finalPass, finalFail, finalDisabled = try.reportFinal()

print(string.format("FINAL COUNT: %i PASSED, %s FAILED, %s DISABLED", finalPass, finalFail, finalDisabled))

--todo when Roblox CLI comes out, make process exit

return finalFail == 0