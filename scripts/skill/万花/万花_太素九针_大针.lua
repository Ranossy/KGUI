---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_̫�ؾ���_����.lua
-- ����ʱ��:	2013/6/6 19:40:12
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_̫�ؾ���_����.lua
-- ������    :  ���	
-- ����ʱ��  :  2008-8-20 
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  �⹦
-- �书��·  :  ̫�ؾ���
-- ��������  :  ����
-- ����Ч��  :  �����������,��Ŀ��ظ�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nMana = 1808, nDamageRand = 0, nCostLife = 1808},
	{ nMana = 2518, nDamageRand = 0, nCostLife = 2518},
	{ nMana = 3318, nDamageRand = 0, nCostLife = 3318},
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_̫�ؾ���_����.lua",
		0
	);	

	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff   
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		-- ����CD1��
	skill.SetNormalCoolDown(1, 208);		-- 3����CD
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= 0;	--tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostLife	=	tSkillData[dwSkillLevel].nCostLife;--������Ѫ
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	--skill.nWeaponDamagePercent	= 1024;
	
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius = 30 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 30 * LENGTH_BASE;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nSelfLifePercentMin = 50;				-- Ѫ����Сֵ>=
    
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	--skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = GetPlayer(dwCharacterID)
	target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.2
	if not player.GetBuff(6321, 1) then
		player.nCurrentLife = player.nCurrentLife-player.nMaxLife * 0.2
		player.AddBuff(dwSkillSrcID, player.nLevel, 6321, 1, 1)
	end
	--if not IsPlayer(dwCharacterID) then
	--return
	--end
	--local player = GetPlayer(dwCharacterID)
	--if not player then
	--return
	--end
	--local targetType , targetID = player.GetSkillTarget ()
	--local target = GetPlayer(targetID)
	--if not target then
	--return
	--end
	--if player.GetSkillLevel(143) == 1 then
	--if player.nCurrentLife < player.nMaxLife * 20 / 100 then
	--player.nCurrentLife = 10
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--else
	--player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 20 / 100
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--end
	--end
	--if player.GetSkillLevel(143) == 2 then
	--if player.nCurrentLife < player.nMaxLife * 15 / 100 then
	--player.nCurrentLife = 10
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 30 / 100
	--else
	--player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 15 / 100
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 30 / 100
	--end
	--end
	--if player.GetSkillLevel(143) == 3 then
	--if player.nCurrentLife < player.nMaxLife * 20 / 100 then
	--player.nCurrentLife = 10
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--else
	--player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 20 / 100
	--target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 40 / 100
	--end
	--end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com