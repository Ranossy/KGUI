---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_��������.lua
-- ����ʱ��:	2014/2/13 14:12:18
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	if scene.dwMapID == 182 then
		local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
		if not jieduankongzhi then
			player.DelBuff(7501, 1)
			return
		end
		
		if jieduankongzhi then
			if jieduankongzhi.GetCustomInteger1(2) ~= 3 then
				player.DelBuff(7501, 1)
				return
			end
		end
		
		if player.GetBuff(7501, 1) then
			if player.GetBuff(7501, 1).nLeftActiveCount <= 22 and player.GetBuff(7501, 1).nLeftActiveCount > 12 then
				if not player.GetBuff(7509, 1) then
					player.AddBuff(0, 99, 7509, 1, 30)
				end
			end
			
			if player.GetBuff(7501, 1).nLeftActiveCount <= 12 then
				player.DelBuff(7509, 1)
				if not player.GetBuff(7510, 1) then
					player.AddBuff(0, 99, 7510, 1, 12)
				end
			end
		end
	end

	if scene.dwMapID == 183 then
		local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
		if not jieduankongzhi then
			player.DelBuff(7501, 2)
			return
		end
		
		if jieduankongzhi then
			if jieduankongzhi.GetCustomInteger1(2) ~= 3 then
				player.DelBuff(7501, 2)
				return
			end
		end
		
		if player.GetBuff(7501, 2) then
			if player.GetBuff(7501, 2).nLeftActiveCount <= 22 and player.GetBuff(7501, 2).nLeftActiveCount > 12 then
				if not player.GetBuff(7509, 2) then
					player.AddBuff(0, 99, 7509, 2, 30)
				end
			end
			
			if player.GetBuff(7501, 2).nLeftActiveCount <= 12 then
				player.DelBuff(7509, 2)
				if not player.GetBuff(7510, 2) then
					player.AddBuff(0, 99, 7510, 2, 12)
				end
			end
		end
	end
end

function UnApply(dwCharacterID)

end

--[[function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		local scene = player.GetScene()
		if scene.dwMapID == 182 then
			local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
			if jieduankongzhi then
				if jieduankongzhi.GetCustomInteger1(2) == 3 then
					player.AddBuff(0, 99, 7501, 1, 30)--����
					
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

		if scene.dwMapID == 183 then
			local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
			if jieduankongzhi then
				if jieduankongzhi.GetCustomInteger1(2) == 3 then
					player.AddBuff(0, 99, 7501, 2, 30)--����
					
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

	if player and player.nMoveState == MOVE_STATE.ON_DEATH then
		local scene = player.GetScene()
		local jieduankongzhi = scene.GetNpcByNickName("jieduanjiemiankongzhi")
		if scene.dwMapID == 182 then
			if jieduankongzhi then
				if jieduankongzhi.GetCustomInteger1(2) == 3 then
					player.AddBuff(0, 99, 7635, 1, 60)--��������ά��
					
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

		if scene.dwMapID == 183 then
			if jieduankongzhi then
				if jieduankongzhi.GetCustomInteger1(2) == 3 then
					player.AddBuff(0, 99, 7635, 1, 60)--��������ά��
					
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
end--]]
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com