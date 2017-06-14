------------------------------------------------
-- �ļ���    :  ����_ʩչ�Ṧ�����¼�_�˺�.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-27
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ����
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
		{nDamage=115,nDamageRand=5},
		{nDamage=163,nDamageRand=5},
		{nDamage=211,nDamageRand=5},
		{nDamage=259,nDamageRand=5},
		{nDamage=307,nDamageRand=5}
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

		local bRetCode     = false;
		local dwSkillLevel	= skill.dwLevel
		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
        tSkillData[dwSkillLevel].nDamage, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
        0, 
        0
    );
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		535,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
		"skill/����/����_筴�����_�˺�Ч��.lua",				-- ����ֵ1
		0														-- ����ֵ2
	);
    

	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
		--������λ
		--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
		----------------- ���ü������� ---------------------------------------------------------------------
		-- skill.nCostMana			= 0;
	
    --------------- ����������� ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
		-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius				= 0;										--����ʩ����С�뾶
    skill.nMaxRadius        = 5 * LENGTH_BASE;			--����ʩ�����뾶
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    skill.nChannelInterval	= 64;
    
		skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.Stop() 
		player.AddBuff(0,99,1936,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com