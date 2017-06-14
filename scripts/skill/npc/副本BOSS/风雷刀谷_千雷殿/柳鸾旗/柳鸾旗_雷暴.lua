---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳鸾旗/柳鸾旗_雷暴.lua
-- 更新时间:	2016/12/5 15:56:02
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local playertarget = GetPlayer(dwCharacterID)
	if not playertarget then
		return
	end

	local scene = playertarget.GetScene()
	local liuluanqileibaokongzhi = scene.GetNpcByNickName("liuluanqileibaokongzhi")
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if liuluanqileibaokongzhi then
			playertarget.AddBuff(playertarget.dwID, playertarget.nLevel, 11562, 1, 2)
			playertarget.PlaySfx(1559, playertarget.nX, playertarget.nY, playertarget.nZ)
			playertarget.PlaySfx(8672, playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.SetPosition(playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.CastSkill(17190, 1)
			liuluanqileibaokongzhi.CastSkill(17189, 1)
			liuluanqileibaokongzhi.CastSkill(17188, 1)
		end
	end

	if scene.dwMapID == 270 then
		if liuluanqileibaokongzhi then
			playertarget.AddBuff(playertarget.dwID, playertarget.nLevel, 11562, 2, 2)
			playertarget.PlaySfx(1559, playertarget.nX, playertarget.nY, playertarget.nZ)
			playertarget.PlaySfx(8672, playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.SetPosition(playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.CastSkill(17190, 2)
			liuluanqileibaokongzhi.CastSkill(17189, 2)
			liuluanqileibaokongzhi.CastSkill(17188, 2)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com