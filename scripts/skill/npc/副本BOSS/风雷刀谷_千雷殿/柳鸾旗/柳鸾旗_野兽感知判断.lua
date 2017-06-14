---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳鸾旗/柳鸾旗_野兽感知判断.lua
-- 更新时间:	2016/12/8 15:27:58
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	local leishishou3 = scene.GetNpcByNickName("leishishou3")
	local leishishou4 = scene.GetNpcByNickName("leishishou4")
	local Num = string.sub(npc.szName, 11)
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if Num == "1" then
			if leishishou3 then
				if GetCharacterDistance(npc.dwID, leishishou3.dwID) <= 1920 then
					if not npc.GetBuff(11570, 1) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end

					if not leishishou3.GetBuff(11570, 1) then
						leishishou3.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end
				else
					npc.DelBuff(11570, 1)
					leishishou3.DelBuff(11570, 1)
				end
			end
		end

		if Num == "2" then
			if leishishou4 then
				if GetCharacterDistance(npc.dwID, leishishou4.dwID) <= 1920 then
					if not npc.GetBuff(11570, 1) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end

					if not leishishou4.GetBuff(11570, 1) then
						leishishou4.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end
				else
					npc.DelBuff(11570, 1)
					leishishou4.DelBuff(11570, 1)
				end
			end
		end
	end

	if scene.dwMapID == 270 then
		if Num == "1" then
			if leishishou3 then
				if GetCharacterDistance(npc.dwID, leishishou3.dwID) <= 1920 then
					if not npc.GetBuff(11570, 2) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end

					if not leishishou3.GetBuff(11570, 2) then
						leishishou3.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end
				else
					npc.DelBuff(11570, 2)
					leishishou3.DelBuff(11570, 2)
				end
			end
		end

		if Num == "2" then
			if leishishou4 then
				if GetCharacterDistance(npc.dwID, leishishou4.dwID) <= 1920 then
					if not npc.GetBuff(11570, 2) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end

					if not leishishou4.GetBuff(11570, 2) then
						leishishou4.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end
				else
					npc.DelBuff(11570, 2)
					leishishou4.DelBuff(11570, 2)
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