--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	--多少玩家打
	local playerNumber = 1

	
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return 
	end
	player.SitDown()
	
	local scene = player.GetScene()
	if not scene then
		return
	end

	--如果这个玩家召唤过阵法，则删除召唤过的阵法
	for i = 1,5 do
		local doodadthis = scene.GetDoodadByNickName("WuduPQ95" .. tostring(dwSkillSrcID) .. tostring(i))
		if doodadthis then
			player.PlaySfx(244,doodadthis.nX,doodadthis.nY,doodadthis.nZ)
			doodadthis.SetDisappearFrames(1,1)
		end
	end


	---阵法召唤
	for i = 1, playerNumber do
		local nickNameString = "WuduPQ95"..tostring(dwSkillSrcID)..tostring(i)
		local posX = player.nX + (3 * 64) * math.cos( 2 * math.pi  *  ( i - 1 ) / playerNumber )
		local posY = player.nY + (3 * 64) * math.sin( 2 * math.pi  *  ( i - 1 ) / playerNumber )
		local posZ = player.nZ
		
		local thisDoodad = scene.CreateDoodad(5976, posX, posY, posZ, 1, nickNameString )
		thisDoodad.SetCustomInteger4(1, tonumber(dwSkillSrcID)) -- 设置召唤者ID
		thisDoodad.SetCustomInteger4(5, tonumber(dwSkillSrcID)) -- 设置默认操控者为召唤者
		thisDoodad.SetDisappearFrames(960)
		player.PlaySfx(244,posX,posY,posZ)
	end
	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com