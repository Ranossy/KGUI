------------------------------------------------
-- 创建人   :  陶李
-- 创建时间	:  2011-8-23
-- 效果备注	:  80橙武
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
    	local result = character.AddBuff(0,99,3189,1)      -- 非正常结束
    end
end;

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com