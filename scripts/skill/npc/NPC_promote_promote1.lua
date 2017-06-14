--剑侠情缘网络版三 千秋万载 一统江湖
--武功技能
--NPC技能-民兵队长的鼓舞能力
--技能效果简单说明：鼓舞技能,，给自己和友方的一个目标增加x点力量、y点敏捷、z点活力、w点精神
--刘欣 2006-8-17


--------------我不是分割线----------------------------------------------------

tSkillData =
{
      nCostMana = 5
};


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能相关数值
function GetSkillLevelData(skill)
    
	
--设置BUFF---------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		140,
		1	
	);


--设置cool down------

--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------

     skill.SetNormalCoolDown(1,7);
	
--设置其他参数-------
  
    --内力消耗
    skill.nCostMana         = tSkillData.nCostMana;
    --攻击半径，也就是攻击的有效距离
    skill.nMaxRadius        = 10 * LENGTH_BASE;
    skill.nAngleRange       = 128; 
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
    skill.nBreakRate        = 1000;
   
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--npc: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(npc, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end



 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com