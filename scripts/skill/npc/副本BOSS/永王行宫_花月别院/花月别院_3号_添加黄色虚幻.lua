---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_花月别院/花月别院_3号_添加黄色虚幻.lua
-- 更新时间:	2015/6/2 11:51:44
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npctarget = GetNpc(dwCharacterID)
	local scene
	if npctarget and npctarget.nMoveState ~= MOVE_STATE.ON_DEATH then
		scene = npctarget.GetScene()
		if scene.dwMapID == 221 then
			npctarget.AddBuff(0, 99, 8983, 1, 30)
		end

		if scene.dwMapID == 230 or scene.dwMapID == 233 then
			npctarget.AddBuff(0, 99, 8983, 2, 30)
		end

		if scene.dwMapID == 235 then
			npctarget.AddBuff(0, 99, 8983, 3, 15)
		end

		if scene.dwMapID == 237 then
			npctarget.AddBuff(0, 99, 8983, 4, 15)
		end
	end

	local playertarget = GetPlayer(dwCharacterID)
	if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
		scene = playertarget.GetScene()
		if scene.dwMapID == 221 then
			playertarget.AddBuff(0, 99, 8983, 1, 30)
		end

		if scene.dwMapID == 230 or scene.dwMapID == 233 then
			playertarget.AddBuff(0, 99, 8983, 2, 30)
		end

		if scene.dwMapID == 235 then
			playertarget.AddBuff(0, 99, 8983, 3, 15)
		end

		if scene.dwMapID == 237 then
			playertarget.AddBuff(0, 99, 8983, 4, 15)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com