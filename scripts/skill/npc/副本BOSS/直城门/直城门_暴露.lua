------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-10-7
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.nX > 14529 and player.nX < 19351  and player.nY > 15031 and player.nY < 24626 then
		player.PlayCameraAnimation(84, 0)
		local scene = player.GetScene()
		local npc = scene.GetNpcByNickName("Spiner1")
		if not npc then
			return
		end
		npc.CastSkill(8286,1,TARGET.PLAYER,dwCharacterID)
		npc.DoAction(0, 10058)
		npc.Yell(GetEditorString(6, 805))
		for i = 1, 5 do
			local npc_cf = scene.GetNpcByNickName("chengfang" .. i)
			if not npc_cf then
				npc_cf = scene.CreateNpc(26875, 18562, 24439, 1048576, 0, -1, "chengfang" .. i)
				if npc_cf then
					npc_cf.SetPatrolPath(56, 1, i)
				end
			end
		end
	end
	if player.nX > 14084 and player.nX < 19538 and player.nY > 40980 and player.nY < 51171 then
		player.PlayCameraAnimation(84, 0)
		local scene = player.GetScene()
		local npc = scene.GetNpcByNickName("Spiner2")
		if not npc then
			return
		end		
		npc.CastSkill(8286,1,TARGET.PLAYER,dwCharacterID)
		npc.DoAction(0, 10058)
		npc.Yell(GetEditorString(6, 805))
		for i = 6, 10 do
			local npc_cf = scene.GetNpcByNickName("chengfang" .. i)
			if not npc_cf then
				npc_cf = scene.CreateNpc(26875, 18562, 40870, 1048576, 0, -1, "chengfang" .. i)
				if npc_cf then
					npc_cf.SetPatrolPath(57, 1, i - 5)
				end
			end
		end
	end	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com