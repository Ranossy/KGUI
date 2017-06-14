--郑海星 20110531 下品万通丹

--------------厚道的分割线-----------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")



--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SIT,
		0,
		0
	);
	
	-- 回血回蓝的打坐BUFF
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		103,
		1
	);
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        2901,
        dwSkillLevel
    );
    ----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    
    skill.SetNormalCoolDown(1, 192);			--打坐单独CD1.5秒
    skill.SetCheckCoolDown(1, 444)
	
    ----------------- 设置杂项参数 ----------------------------------------
   
    --升级经验
    --skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;    

    --攻击半径，也就是攻击的有效距离
    --skill.nMaxRadius        = 2 * LENGTH_BASE;
    --skill.nAngleRange       = 128; 
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    --skill.nBulletVelocity   = 
    --被打断的概率
    skill.nBreakRate        = 1024;
   
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)	
end

-- 目的是为了保证在打坐中进入战斗或自行点掉打坐buff时时可自行站起
function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		
		if player.nMoveState == MOVE_STATE.ON_SIT then
			player.Stand()
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com