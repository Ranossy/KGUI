--������Ե������� ǧ������ һͳ����
--�书����
--NPC����-BOSS����


--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 1, nTherapy=15000},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 2, nTherapy=15000},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 3, nTherapy=15000},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 4, nTherapy=15000},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 5, nTherapy=15000},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 6, nTherapy=15000},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 7, nTherapy=15000},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 8, nTherapy=15000},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 9, nTherapy=15000},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 10, nTherapy=15000},		--level 10
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 11, nTherapy=15000},		--level 11
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 12, nTherapy=15000},		--level 12
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 13, nTherapy=15000},		--level 13
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 14, nTherapy=15000},		--level 14
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 15, nTherapy=15000},		--level 15
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 16, nTherapy=15000},		--level 16
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 17, nTherapy=15000},		--level 17
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 18, nTherapy=15000},		--level 18
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 19, nTherapy=15000},		--level 19
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 20, nTherapy=15000},		--level 20
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
    
    local dwSkillLevel = skill.dwLevel;
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY, 
        tSkillData[dwSkillLevel].nLifeAdd,
        0
    );	
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY, 
        0,
        0
    );
    
    ----------------- ����Hot ---------------------------------------------
    

	
    ----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    --   skill.SetNormalCoolDown(1, 7);
    
    ----------------- ����������� ----------------------------------------
   
    --��������
    --skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;    
    --��������
    --skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 20 * LENGTH_BASE;
    skill.nAngleRange       = 256; 
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nBreakRate        = 0;
   
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com