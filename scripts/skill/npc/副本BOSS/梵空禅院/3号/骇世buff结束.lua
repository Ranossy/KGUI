---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/梵空禅院/3号/骇世buff结束.lua
-- 更新时间:	2015/5/29 11:27:08
-- 更新用户:	WANGZEYU
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local Player = GetPlayer(dwCharacterID)
	if not Player then
		return
	end

	local scene = Player.GetScene()
	local Master = scene.GetNpcByNickName("Jiansheng")
	local AllPlayer = scene.GetAllPlayer()

	if Master then
		Master.CastSkillXYZ(13915, 1, Player.nX, Player.nY, Player.nZ)
		Master.PlaySfx(1152, Player.nX, Player.nY, Player.nZ + 500)

		for i = 1, #AllPlayer do
			local GPlayer = GetPlayer(AllPlayer[i])
			if GPlayer ~= Player and GPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				if GetCharacterDistance(Player.dwID, GPlayer.dwID) < 320 then
					GPlayer.AddBuff(0, 99, 8817, 1)
					Master.AddBuff(0, 99, 8877, 1)
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com