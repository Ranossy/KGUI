---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/协助npc李复李承恩行为控制_移动到指定点特效.lua
-- 更新时间:	2016/5/12 15:13:54
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	local scene = player.GetScene()
	local LiChengEn = scene.GetNpcByNickName("LiChengEn")
	local LiFu = scene.GetNpcByNickName("LiFu")
	local jihuomubiaokongzhi = scene.GetNpcByNickName("jihuomubiaokongzhi")
	if jihuomubiaokongzhi then
		jihuomubiaokongzhi.SetCustomInteger4(16, nX + 1)
		jihuomubiaokongzhi.SetCustomInteger4(20, nY + 1)
		jihuomubiaokongzhi.SetCustomInteger4(24, nZ + 1)
	end
	
	if LiChengEn then
		if LiChengEn.GetCustomBoolean(1) == true then
			--LiChengEn.RunTo(nX, nY)
			LiChengEn.FireAIEvent(2002, 0, 1)
		end
	end

	if LiFu then
		if LiFu.GetCustomBoolean(1) == true then
			--LiFu.RunTo(nX, nY)
			LiFu.FireAIEvent(2002, 0, 1)
		end
	end
end

function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com