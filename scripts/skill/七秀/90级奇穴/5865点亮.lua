---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/90级奇穴/5865点亮.lua
-- 更新时间:	2013/5/9 16:13:00
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(1383, 2) then
		--player.DelBuff(5865,1)
		player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
	else
		for i = 1, 7 do
			if player.GetBuff(409, i) then
				local	nBuff = player.GetBuff(409, i)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then
					--player.DelBuff(5865,1)
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				--if stackNum >= 4  then			
					--player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				--end
			end
			if player.GetBuff(409, i + 7) then
				local	nBuff = player.GetBuff(409, i + 7)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then
					--player.DelBuff(5865,1)
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				--if stackNum >= 4  then			
					--player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				--end
			end
			if player.GetBuff(409, i + 14) then
				local	nBuff = player.GetBuff(409, i + 14)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then
					--player.DelBuff(5865,1)
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				--if stackNum >= 4  then			
					--player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				--end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com