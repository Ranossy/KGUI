Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.DASH, 
        120, 
        0
    );

	--设置技能攻击破绽段位
    skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER;
    
    --破绽附加效果
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_ON_MAJOR_WEAK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        422, 
        1
    );
	    
    ----------------- 设置Debuff ------------------------------------------
    
	--skill.BindDebuff(1);
    
    ----------------- 设置Dot --------------------------------------------

	--skill.BindDot(1);

    ----------------- 设置Hot ---------------------------------------------
    

	--skill.BindHot(1);

    ----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    
    --skill.SetNormalCoolDown(1, 2);

    
    ----------------- 设置杂项参数 ----------------------------------------
   
    --升级经验
    skill.dwLevelUpExp      = dwSkillLevel * 10 + 100;    
    --skill.dwExpAdd					= 30;
    --内力消耗
    skill.nCostMana         = dwSkillLevel / 2 + 3;       
    --攻击半径，也就是攻击的有效距离
		skill.nMinRadius 		= 0;
    skill.nMaxRadius        = (30 + dwSkillLevel * 2) * LENGTH_BASE;    
    
    skill.nAreaRadius       = 50 * LENGTH_BASE;
    
    skill.nAngleRange       = 256;
    
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度,单位: 厘米 / 秒
    skill.nBulletVelocity   = 0 * LENGTH_BASE;
    --被打断的概率
    skill.nBreakRate        = 0.3 * PERCENT_BASE;
	
	--通道技设置时间参数----
	skill.nChannelFrame     = 60 * GAME_FPS;
	skill.nChannelInterval  = 2 * GAME_FPS;
    
    
   
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--以下是魔法属性执行脚本时,要 调用的函数; dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	--print("哈哈, FOR TEST;(Apply)")
end

function UnApply(dwCharacterID)
	--print("哈哈, FOR TEST;(UnApply)")
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com