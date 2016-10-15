/**********************************************************************************\
  Spacebuild Mining Add-On Support, e2 extensions by Kevin Minion rev. 2016-10-15
\**********************************************************************************/

--Register
E2Lib.RegisterExtension("sbma", true, "Space Build Mining Addon e2 Functions by Kevin Minion")

if SERVER then 

	local IsValid = E2Lib.IsValid
	
	--Loading Messages
	Msg( " \n")
	Msg( " \n")
	Msg( "//======================================\\\\ \n")
	Msg( "|| Space Build Mining Addon e2 Functions || \n")
	Msg( "||           by Kevin Minion             || \n")
	Msg( "||---------------------------------------|| \n")	

	Msg( "||  sbmaIsAsteroid()                     || \n")

	__e2setcost(1)

	e2function number entity:sbmaIsAsteroid()
	-- Returns 1 if the entity is an asteroid
	
			if (this == nil) then
				return 0
			end
	
			if (this.IsValid) then
				if (this.asteroid) then
					return 1
				end
			end

			return 0
	end


	Msg( "||  sbmaMaxCapacity()                    || \n")

	__e2setcost(1)

	e2function number entity:sbmaMaxCapacity()
	-- Returns how many total units (resource + rock) are in the asteroid
	
		local total = 0
		
		if (this.asteroid) then
			total = this.maxcap
		end
		
		return total
	end


	Msg( "||  sbmaTotalResources()                 || \n")

	__e2setcost(1)

	e2function number entity:sbmaTotalResources()
	-- Returns how many units of the asteroid are resources (not rock)
	 
		local total = 0
		
		if (this.asteroid) then
			total = this.totalResources
		end
		
		return total
	end


	Msg( "||  sbmaHasResource(string)              || \n")

	__e2setcost(5)

	e2function number entity:sbmaHasResource(string res)
	-- Returns 1 if the specified resource exists in an asteroid
	
		ret = 0

		if (this.asteroid) then
			for key,val in pairs(this.resources) do
				if (string.lower(key) == string.lower(res)) then
					ret = 1
				end
			end
		end
		
		return ret

	end


	Msg( "||  sbmaGetAllResources()                || \n")

	local DEFAULT = {n={},ntypes={},s={},stypes={},size=0,istable=true,depth=0}

	__e2setcost(5)
		
	e2function table entity:sbmaGetAllResources()
	-- Returns a table of resource names and amounts
	
		local ret = table.Copy(DEFAULT)

		local size = 0
		
		if (this.asteroid) then
			for key,val in pairs(this.resources) do

				for k,v in pairs(val) do 
					if k=="amount" then
						ret.s[key] = v
						size = size + 1
					end
				end
			end
				
		end
		
		ret.size = size
		return ret

	end


	Msg( "||  sbmaGetResource(string)              || \n")

	__e2setcost(5)

	e2function number entity:sbmaGetResource(string res)
	-- Returns the amount of specified resource in an asteroid
	
		ret = 0

		if (this.asteroid) then
			for key,val in pairs(this.resources) do
				if (string.lower(key) == string.lower(res)) then
					for k,v in pairs(val) do 
						if k=="amount" then
							ret = v
						end
					end
				end
			end
		end
		
		return ret

	end


	Msg( "||  sbmaResourceDifficulty(string)       || \n")

	__e2setcost(5)

	e2function number entity:sbmaResourceDifficulty(string res)
	-- Returns the difficulty (rating?) of a specified resource
	
		ret = 0
		
		if (this.asteroid) then
			for key,val in pairs(this.resources) do
				if (string.lower(key) == string.lower(res)) then
					for k,v in pairs(val) do 
						if (k=="difficulty") then
							ret = v
						end
					end
				end
			end
		end
		
		return ret
	end


	Msg( "||  sbmaHasResourceGroup(string)         || \n")

	__e2setcost(10)
	
	e2function number entity:sbmaHasResourceGroup(string res)
	-- Returns 1 if the specified resource group exists in an asteroid
	
		ret = 0

		if (this.asteroid) then
			
			if (string.lower(res) == "abundant") then
			
				for key,val in pairs(this.resources) do
					local lowkey = string.lower(key)
					if (lowkey == "rock" or lowkey == "ice") then ret = 1 end
				end
			end
			
			if (string.lower(res) == "common") then
			
				for key,val in pairs(this.resources) do
					local lowkey = string.lower(key)
					if (lowkey == "iron") then ret = 1 end
				end
			end

			if (string.lower(res) == "uncommon") then
			
				for key,val in pairs(this.resources) do
					local lowkey = string.lower(key)
					if (lowkey == "titanium" or lowkey == "uranium" or lowkey == "copper" or lowkey == "aluminium") then ret = 1 end
				end
			end
			
			if (string.lower(res) == "rare") then
			
				for key,val in pairs(this.resources) do
					local lowkey = string.lower(key)
					if (lowkey == "lithium") then ret = 1 end
				end
			end

			if (string.lower(res) == "veryrare" or string.lower(res) == "very rare") then
			
				for key,val in pairs(this.resources) do
					local lowkey = string.lower(key)
					if (lowkey == "chromite" or lowkey == "plutonium") then ret = 1 end
				end
			end

			if (string.lower(res) == "precious") then
			
				for key,val in pairs(this.resources) do
					local lowkey = string.lower(key)
					if (lowkey == "mercury" or lowkey == "platinum" or lowkey == "obsidian" or lowkey == "iridium" or lowkey == "gold" or lowkey == "silver") then ret = 1 end
				end
			end

		end
		
		return ret

	end


	Msg( "||---------------------------------------|| \n")
	Msg( "|| Space Build Mining Addon e2 Functions || \n")
	Msg( "||             Load Complete             || \n")
	Msg( "\\\\======================================// \n")
	Msg( "\n")
	
end
