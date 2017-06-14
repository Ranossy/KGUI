---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳鸾旗/柳鸾旗_狂雷母buff.lua
-- 更新时间:	2016/12/5 15:52:05
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
	local index = Random(1, 20)
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if index == 10 then
			if playertarget and not playertarget.GetBuff(11556, 1) then
				playertarget.Stop()
				playertarget.PlaySfx(8670, playertarget.nX, playertarget.nY, 1355840)
				playertarget.PlaySfx(8682, 0, 0, 0)
				playertarget.AddBuff(playertarget.dwID, playertarget.nLevel, 11556, 1, 2)
			end
		end
	end

	if scene.dwMapID == 270 then
		if index == 10 then
			if playertarget and not playertarget.GetBuff(11556, 2) then
				playertarget.Stop()
				playertarget.PlaySfx(8670, playertarget.nX, playertarget.nY, 1355840)
				playertarget.PlaySfx(8682, 0, 0, 0)
				local liuluanqiboss = scene.GetNpcByNickName("liuluanqiboss")
				if liuluanqiboss then
					playertarget.AddBuff(liuluanqiboss.dwID, liuluanqiboss.nLevel, 11969, 2, 1)
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com