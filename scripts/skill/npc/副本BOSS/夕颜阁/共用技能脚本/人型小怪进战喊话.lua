---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/夕颜阁/共用技能脚本/人型小怪进战喊话.lua
-- 更新时间:	2016/9/20 15:19:55
-- 更新用户:	yangfan14
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local bddz = GetNpc(nCharacterID)
	if bddz then
		local scene = bddz.GetScene()
		if scene then
			if bddz.dwTemplateID == 53040 or bddz.dwTemplateID == 53041 or bddz.dwTemplateID == 53042 or bddz.dwTemplateID == 53043 or bddz.dwTemplateID == 54773 or bddz.dwTemplateID == 54774 or bddz.dwTemplateID == 54775 or bddz.dwTemplateID == 54776 or bddz.dwTemplateID == 54866 or bddz.dwTemplateID == 54867 or bddz.dwTemplateID == 54868 or bddz.dwTemplateID == 54869 then
				local a = Random(1, 8)
				if a == 1 then
					bddz.Say(GetEditorString(5, 1313))
				end
				if a == 2 then
					bddz.Say(GetEditorString(1, 7765))
				end
				if a == 3 then
					bddz.Say(GetEditorString(10, 7001))
				end
				if a == 4 then
					bddz.Say(GetEditorString(10, 7002))
				end
				if a == 5 then
					bddz.Say(GetEditorString(10, 7003))
				end
			end
		end
		if scene then
			if bddz.dwTemplateID == 53044 or bddz.dwTemplateID == 53045 or bddz.dwTemplateID == 53046 or bddz.dwTemplateID == 53047 or bddz.dwTemplateID == 54777 or bddz.dwTemplateID == 54778 or bddz.dwTemplateID == 54779 or bddz.dwTemplateID == 54780 or bddz.dwTemplateID == 54870 or bddz.dwTemplateID == 54871 or bddz.dwTemplateID == 54872 or bddz.dwTemplateID == 54873 then
				local a = Random(1, 8)
				if a == 1 then
					bddz.Say(GetEditorString(5, 1313))
				end
				if a == 2 then
					bddz.Say(GetEditorString(1, 7765))
				end
				if a == 3 then
					bddz.Say(GetEditorString(10, 7004))
				end
				if a == 4 then
					bddz.Say(GetEditorString(10, 7005))
				end
				if a == 5 then
					bddz.Say(GetEditorString(10, 7006))
				end
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com