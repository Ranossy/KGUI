---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/艺人_做椅子监控.lua
-- 更新时间:	2016/7/13 17:38:26
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local buff = player.GetBuff(10978, 1)
	if not buff then
		player.DoAction(0, 0)
		return
	end
	local chair = GetNpc(buff.nCustomValue)
	if not chair then
		player.DoAction(0, 0)
		player.DelBuff(10978, 1)
		return
	end
	if GetDistanceSq(chair.nX, chair.nY, chair.nZ, player.nX, player.nY, player.nZ) <= (0.6 * 64) ^ 2 and math.abs(player.nFaceDirection - chair.nFaceDirection) <= 5 then
		player.DoAction(0, 20164)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com