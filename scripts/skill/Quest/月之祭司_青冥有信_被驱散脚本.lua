------------------------------------------------
-- 文件名    :  青冥有信被驱散脚本.lua
-- 创建人    :  zhx
-- 创建时间  :  20110407
-- 用途(模块):  PQ
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  被驱散则造成伤害
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local character;    
	if IsPlayer(nCharacterID) then
		character = GetPlayer(nCharacterID);
	else
		character = GetNpc(nCharacterID);
	end       
	if nLeftFrame == 0 then -- 正常结束，剩余时间为0
	else
		character.CastSkill(2923, 1)      -- 非正常结束
	end
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com