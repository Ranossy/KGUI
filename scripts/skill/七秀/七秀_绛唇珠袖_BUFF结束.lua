------------------------------------------------
-- 文件名    :  DefaultBuff.lua
-- 创建人    :  WangTao
-- 创建时间  :  2008-03-28
-- 用途(模块):  BUFF功能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  默认的BUFF脚本
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
    	character.CastSkill(508,nBuffLevel)       -- 非正常结束
    end
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com