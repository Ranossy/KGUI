---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_仙侣庭院/4号_仲虚念/硬狂暴计时.lua
-- 更新时间:	2015/11/17 20:21:07
-- 更新用户:	WANGZEYU
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local TPlayer = GetNpc(dwCharacterID)
	if not TPlayer then
		return
	end

	local scene = TPlayer.GetScene()
	if not scene then
		return
	end

	local AllPlayer = scene.GetAllPlayer()
	for i = 1, #AllPlayer do
		local Target = GetPlayer(AllPlayer[i])
		if Target and Target.nMoveState ~= MOVE_STATE.ON_DEATH then
			TPlayer.PlaySfx(1155, Target.nX, Target.nY, Target.nZ)
		end
	end

	local Area_Con = scene.GetNpcByNickName("MonkArea_Control")
	local Monk = scene.GetNpcByNickName("Zhongxunian")
	if Area_Con and Monk then
		for i = 1, 3 do
			Monk.CastSkillXYZ(14112, 3, Area_Con.nX, Area_Con.nY, Area_Con.nZ)
			Monk.AddBuff(0,99,3819,1)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com