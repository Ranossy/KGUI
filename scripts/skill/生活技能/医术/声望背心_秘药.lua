--�������⿡�ҽ��BUFF�༼��
--֣����
--20110601

--------------�Ҳ��Ƿָ���----------------------------------------------------

tSkillData =
{
      	{BUFFID = 3037,BUFFLEVEL = 1 }, -- 1���Ե�
        {BUFFID = 3038,BUFFLEVEL = 1 }, -- 2���ؾ���
        {BUFFID = 3039,BUFFLEVEL = 1 }, -- 3������
        {BUFFID = 3040,BUFFLEVEL = 1 }, -- 4��������
        {BUFFID = 3041,BUFFLEVEL = 1 }, -- 5������
      	{BUFFID = 3042,BUFFLEVEL = 1 }, -- 6����������
        {BUFFID = 3043,BUFFLEVEL = 1 }, -- 7���嶾
        {BUFFID = 3044,BUFFLEVEL = 1 }, -- 8����ԯ��
        {BUFFID = 3045,BUFFLEVEL = 1 }, -- 9�������ھ�
        {BUFFID = 3046,BUFFLEVEL = 1 }, -- 10��ף�ڵ�
        {BUFFID = 5298,BUFFLEVEL = 1 }, -- 11���ݻ��
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        tSkillData[dwSkillLevel].BUFFID,
        tSkillData[dwSkillLevel].BUFFLEVEL
    );
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     skill.SetNormalCoolDown(1,76);
     skill.SetNormalCoolDown(2,129);
	
--������������-------
  
    --��������
   -- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
   -- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
   -- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --����֡��
    --skill.nPrepareFrames    = PRE_FRAMES;
    --�ӵ��ٶ�
   -- skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
  --  skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com