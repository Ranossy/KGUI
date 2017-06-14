---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_安禄山_死亡诅咒尸体维持.lua
-- 更新时间:	2014/3/17 20:26:07
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
	if not jieduankongzhi then
		player.DelBuff(7635, 1)
		return
	end
	
	if jieduankongzhi then
		if jieduankongzhi.GetCustomInteger1(2) ~= 3 then
			player.DelBuff(7635, 1)
			return
		end
	end
end

function UnApply(dwCharacterID)

end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	if scene.dwMapID == 182 then
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			--[[if player.GetBuff(7635, 1) then
				local num = player.GetBuff(7635, 1).nLeftActiveCount
				player.DelBuff(7635, 1)--删除维持
				player.AddBuff(0, 99, 7501, 1, num)
			end--]]
			local num = nLeftFrame / 16
			player.AddBuff(0, 99, 7501, 1, num)
		end
	
		if player and player.nMoveState == MOVE_STATE.ON_DEATH then
			local scene = player.GetScene()
			local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
			if jieduankongzhi then
				if jieduankongzhi.GetCustomInteger1(2) == 3 then
					player.AddBuff(0, 99, 7635, 1, 60)--诅咒死亡维持
					
					local playerlist = scene.GetAllPlayer()
					local newtable = {}
					local k = 1
					for i = 1, #playerlist do
						local playertarget = GetPlayer(playerlist[i])
						if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
							if not playertarget.GetBuff(7501, 1) then
								if playertarget.dwID ~= player.dwID then
									newtable[k] = playerlist[i]
									k = k + 1
								end
							end
						end
					end
			
					if #newtable ~= 0 then
						local nindex = Random(1, #newtable)
						local playertarget = GetPlayer(newtable[nindex])
						if playertarget then
							if not playertarget.GetBuff(7501, 1) then
								playertarget.AddBuff(0, 99, 7501, 1, 30)
							end
						end
					end
				end
			end
		
			if player.GetBuff(7509, 1) then
				player.DelBuff(7509, 1)
			end
		
			if player.GetBuff(7510, 1) then
				player.DelBuff(7510, 1)
			end
		end
	end

	if scene.dwMapID == 183 then
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			--[[if player.GetBuff(7635, 1) then
				local num = player.GetBuff(7635, 1).nLeftActiveCount
				player.DelBuff(7635, 1)--删除维持
				player.AddBuff(0, 99, 7501, 1, num)
			end--]]
			local num = nLeftFrame / 16
			player.AddBuff(0, 99, 7501, 2, num)
		end
	
		if player and player.nMoveState == MOVE_STATE.ON_DEATH then
			local scene = player.GetScene()
			local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
			if jieduankongzhi then
				if jieduankongzhi.GetCustomInteger1(2) == 3 then
					player.AddBuff(0, 99, 7635, 1, 60)--诅咒死亡维持
					
					local playerlist = scene.GetAllPlayer()
					local newtable = {}
					local k = 1
					for i = 1, #playerlist do
						local playertarget = GetPlayer(playerlist[i])
						if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
							if not playertarget.GetBuff(7501, 2) then
								if playertarget.dwID ~= player.dwID then
									newtable[k] = playerlist[i]
									k = k + 1
								end
							end
						end
					end
			
					if #newtable ~= 0 then
						local nindex = Random(1, #newtable)
						local playertarget = GetPlayer(newtable[nindex])
						if playertarget then
							if not playertarget.GetBuff(7501, 2) then
								playertarget.AddBuff(0, 99, 7501, 2, 30)
							end
						end
					end
				end
			end
		
			if player.GetBuff(7509, 2) then
				player.DelBuff(7509, 2)
			end
		
			if player.GetBuff(7510, 2) then
				player.DelBuff(7510, 2)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com