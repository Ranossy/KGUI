---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教通用删buff.lua
-- 更新时间:	2014/7/20 10:48:56
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--日系处理
	if player.GetBuff(4025,1) or player.GetBuff(4025,2) or player.GetBuff(8109,1) or player.GetBuff(8109,2) then
		RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 3962, 3)
	end
	
	if player.GetBuff(4025, 1) then
		player.DelBuff(4025,1)
	end

	if player.GetBuff(4025, 2) then
		player.DelBuff(4025,2)
	end

	if player.GetBuff(8109, 1) then
		player.DelBuff(8109,1)
	end

	if player.GetBuff(8109, 2) then
		player.DelBuff(8109,2)
	end



	--月系处理
	if player.GetBuff(4019,1) or player.GetBuff(4019,2) or player.GetBuff(8109,3) or player.GetBuff(8109,4) then
		RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 3959, 3)
	end
	if player.GetBuff(4019, 1) then
		player.DelBuff(4019,1)
	end

	if player.GetBuff(4019, 2) then
		player.DelBuff(4019,2)
	end
	if player.GetBuff(8109, 3) then
		player.DelBuff(8109,3)
	end

	if player.GetBuff(8109, 4) then
		player.DelBuff(8109,4)
	end

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com