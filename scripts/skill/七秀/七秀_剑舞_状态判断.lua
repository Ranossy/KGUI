--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	for i =1 , 7 do
		if player.GetBuff(409,i) then
		local	nBuff = player.GetBuff(409,i)
			stackNum = nBuff.nStackNum
			if stackNum >= 10  then			
    			return 
   		end
   	end
   		if player.GetBuff(409,i+7) then
		local	nBuff = player.GetBuff(409,i+7)
			stackNum = nBuff.nStackNum
			if stackNum >= 10 then			
    			return 
   		end
   	end
 		if player.GetBuff(409,i+14) then
		local	nBuff = player.GetBuff(409,i+14)
			stackNum = nBuff.nStackNum
			if stackNum >= 10  then			
    			return 
   		end
   	end   		
  end
  
  for i =1 , 7 do
  	if player.GetBuff(2353,i) then
			local nLevel = player.GetSkillLevel(537)
			if not nLevel then
				return
			end
			if player.GetSkillLevel(2710) == 1 then
				player.AddBuff(0,99,409,nLevel+7)
				player.AddBuff(player.dwID,player.nLevel,3892,1,1)
				--player.nAccumulateValue = player.nAccumulateValue + 1
			elseif player.GetSkillLevel(2710) == 2 then
				player.AddBuff(0,99,409,nLevel+14)
				player.AddBuff(player.dwID,player.nLevel,3892,1,1)
				--player.nAccumulateValue  = player.nAccumulateValue + 1
			else	
				player.AddBuff(0,99,409,nLevel)
				player.AddBuff(player.dwID,player.nLevel,3892,1,1)
				--player.nAccumulateValue  = player.nAccumulateValue + 1
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com