--������Ե������� ǧ������ һͳ����
--�书����
--NPC����-AOE����
--����Ч����˵������������Χһ����Χ�ͷ�AOE�˺�
--�º���
--08.01.24

----------------------------------------------------------�ְ��ְ��ָ��߰�----------------------------------------------------

tSkillData =
{
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},			--level 1 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 2 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 3 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 4 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 5 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 6 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 7 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 8 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 9 
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 10
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 11
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 12
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 13
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 14
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 15
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 16
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 17
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 18
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 19
   {nCostMana = 168, nAPAdd = 450*0.8, nDamageRand= 450*0.4, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},         --level 20
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����AOE�˺�---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, 
        tSkillData[dwSkillLevel].nAPAdd, --AOE�˺���û��AOE�˺�����ԭ��ֵ����0
        0
    );
	
		skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
        0
    );
    
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, 
        0,
        0
    );
	

--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     --skill.SetNormalCoolDown(1,7);
	
--������������-------
  
    --��������
    --skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    skill.nAreaRadius       = 10 * LENGTH_BASE;
    --����֡��
    skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
    skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
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