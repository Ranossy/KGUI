------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : zhangqi 
-- 创建时间  : 2009-07-16
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 经脉畅行BUFF
-- 经脉效果  : 经脉畅行BUFF
------------------------------------------------

------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local bResult = true;
	
	if IsPlayer(nCharacterID) then
		local player = GetPlayer(nCharacterID);
		
		if nLeftFrame > 0 then 
			player.CastSkill(1132, 1);
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QixueTeachBy.Close")
			local dwDiscipleID = nCustomValue
			if dwDiscipleID ~= 0 then 
				RemoteCallToClient(dwDiscipleID, "CallUIGlobalFunction", "QixueTeachBy.Close", true)
			end
		end
	end
	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com